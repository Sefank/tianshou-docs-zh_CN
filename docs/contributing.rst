参与贡献
========


安装开发版本
------------

天授使用 `poetry <https://python-poetry.org/>`_ 来实现构建和依赖管理。例如，如果要安装所有相关依赖以便开始修改，您可以简单地运行

.. code-block:: bash

   $ poetry install --with dev


提交前的准备
------------

PEP8 代码风格检测与代码格式化
+++++++++++++++++++++++++++++

首先，请在项目根目录运行如下代码以便安装 `pre-commit`：

.. code-block:: bash

   $ pre-commit install

这样就可以确保每次所提交的代码的格式是正确的。

代码由 `black` 和 `ruff` 执行检查和格式化。这两个库会在 pre-commit hook 中执行。\
此外，我们还配置了 `poe the poet` 任务，只需运行 `poe` 即可查看可用的任务。\
例如，要手动格式化和检查代码风格，您可以运行：

.. code-block:: bash

   $ poe format
   $ poe lint


类型检查
++++++++

我们使用 `mypy <https://github.com/python/mypy/>`_ 来检查类型注解。要执行类型检查，请在项目根目录中运行：

.. code-block:: bash

   $ poe type-check


本地测试
++++++++

在项目根目录执行此命令会执行自动测试：

.. code-block:: bash

   $ poe test


使用 GitHub Actions 测试
++++++++++++++++++++++++

1. 点击您自己的仓库的 ``Actions`` 图标：

   .. image:: _static/images/action1.jpg
     :align: center

2. 点击这个绿色按钮：

   .. image:: _static/images/action2.jpg
     :align: center

3. 您会看到 ``Actions Enabled.`` 显示在页面顶部

4. 当您推送新的 commit 到您自己的仓库时（比如说使用 ``git push`` 命令），GitHub Actions 会自动运行测试，并在此页面给出结果：

   .. image:: _static/images/action3.png
     :align: center


文档
----

英文文档
++++++++

英文文档位于项目根目录下的 ``docs/`` 目录中， 以 ReStructuredText (``.rst``) 格式纂写。\
``index.rst`` 是文档的主页。关于 ReStructuredText 的教程可参考\
`这里 <https://pythonhosted.org/an_example_pypi_project/sphinx.html>`_\。

API 参考文档由 `Sphinx <http://www.sphinx-doc.org/en/stable/>`_ 根据 `docs/api/` 下的大纲自动生成，如果相关代码有所变动，则应当修改这个目录下的相应内容。

要将英文文档编译为网页，请运行

.. code-block:: bash

   $ poe doc-build

生成的网页将位于 ``docs/_build`` 目录下，可用浏览器查看。


英文文档生成测试
++++++++++++++++

目前，天授项目仓库中为英文文档配置了三项文档测试：

1. pydocstyle（ruff 的一部分）：检查 ``tianshou`` 目录下的所有文档字符串

2. doc8（ruff 的一部分）：检查 ReStructuredText 格式;

3. sphinx 拼写检查与测试：检查生成前端 html 文档时是否出现错误或警告。

要手动执行这三项测试，请在项目根目录下运行

.. code-block:: bash

   $ poe lint
   $ poe doc-build


中文文档
++++++++

中文文档不存储于天授的项目仓库中，而是存储于独立的 `中文文档仓库`_ 的 ``docs`` 目录下。

除了某些出现在中文文档的内容外，中文文档的内容与结构与英文文档一致，但目前编译构建文档的方式不同。

要编译中文文档，首先请确保使用的系统装有 `make` 构建工具。

1. 将 `中文文档仓库`_ 克隆下来。
2. 使用 `conda` 从 `environment.yml` 文件创建虚拟环境并安装文档构建的相关依赖

   .. warning::

      如果需要修改文档内容，请\ **不要**\ 使用 `requirements.txt` 文件（通过 `pip`）安装依赖。\
      该文件仅用于自动化文档部署，缺乏部分文档检查模块，可能导致下属命令执行异常。

3. 激活上一步创建的创建虚拟环境：

   .. code-block:: bash

      $ conda activate <env_name>

4. 在仓库 **根目录** 下运行如下命令即可启动编译。

   .. code-block:: bash

      $ make build

除了标准的编译命令外，中文文档还使用 `sphinx-autobuild` 配置了变动监视与预览服务器功能，这意味着您可以

* 方便地在浏览器（http://localhost:8000）中打开文档的实时预览
* 在文档代码发生变动时，自动重新编译文档

要使用此功能，请在前述虚拟环境激活的情况下执行

.. code-block:: bash

   $ make

该命令实际上相当于执行 ``make preview``。

.. _中文文档仓库: https://tianshou.readthedocs.io/zh/latest/
