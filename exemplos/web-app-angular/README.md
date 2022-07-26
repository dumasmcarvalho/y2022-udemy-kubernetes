# WebApp Angular

Este é um projeto básico feito em Angular como objeto de estudo para o deploy de uma aplicação web em Docker com Kubernetes.

Foram utilizadas as ferramentas `docker` e `minikube` para configurar um cluster local do Kubernetes.

Também foi utilizado o web server `httpd` do Apache para instanciar esta aplicação web.

Todos comandos necessários para a realização desse experimento estão no script `build.sh`.

Para realizar o deploy da aplicação de forma simplificada (sem o uso do Kubernetes), basta executar o comando a seguir.

No entanto, certifique-se que não há nenhum processo ou serviço alocado na porta 8080 do localhost:
- `docker run -dit --name web-app-angular -p 8080:8080 -v "${PWD}"/dist/web-app-angular/:/usr/local/apache2/htdocs -v "$PWD"/httpd/httpd.conf:/usr/local/apache2/conf/httpd.conf httpd:latest`

Recomenda-se o uso de um sistema operacional Ubuntu ou equivalente para a execução deste projeto.