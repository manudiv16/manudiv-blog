---
author: "Manu Martin"
title: "Better Git Commits"
date: "2022-01-29"

description: "How to make better commits"
categories:
    - Git
tags:
    - Git
  
image: "cherry-pick.jpg"
---

Comence ha escribir este post ya que me causo curiosidad el hecho que haya gente que use herramientas como gitmoji para darle mas semantica a sus commits.

Apartir de ahi vi que la gente ha sentado unas convenciones para escribir mejores commits y trabajar en equipo.
Esto ayuda para la visibilidad de los equipos al leer los commits de otros compañeros que trabajan en la misma base de codigo que tu. Por otra parte estos estandares pueden ayudar en muchos mas entornos, como en el entorno de QA para crear changelogs de la aplicación y centrar los recursos en aquellos puntos donde el desarollo ha estado creciendo o en la parte de integración, ya que al estandarizar podemos automatizar recursos que se activen en un momento especifico de del desarrollo, subrayare mas este tema en las descripciones de cada convención.

## Easy one
Las convencione mas sencillas de seguir y las que recomendaria para equipos pequeños o side-projects seria la de [conventional commits](https://www.conventionalcommits.org).
Se basa en el uso de `fix:`, `feat` y `BREAKING CHANGE` o `!` para discernir entre los tipos de tu commit. Como describia antes al asentar un estandar podemos crear automatizaciones en nuestros flujos dependiendo del tipo de commit, en este caso podriamos hacer una integración en la cual se aumentara la versión de la release dependiendo del tipo.

Otros tipos son bienvenidos pero para controlar que cada programador comience a usar su creatividad sera mejor definirlos en el fichero de `CONTRIBUTING.md` o usar un lintr como [commitlint](https://github.com/conventional-changelog/commitlint).

Otra cosa que nos puede ayudar cuando no esta claro en el cuerpo del commit, en que parte del codigo estamos trabajando, es el uso del ambito.

```
fix(clients): syntax error, added semicolon
```

- **Fix**: Se usaria para corregir un fallo en la base de codigo y esto comportaria en nuestra integración con el cambio de release `PATCH`. 
```bash
# 0.0.1 -> 0.0.2
fix: syntax error, added semicolon
```
- **Feat**: Este cambio añadiria cambios a nuestra base de codigo y dependera de si esta cambia el funcionamiento de la aplicación que la combinaremos con un `BREAKING CHANGE` o una `!`. 
```bash
# 0.3.1 -> 0.4.0
feat: added some logic to do something

# 0.3.1 -> 1.0.0
feat!: added some logic removed support for ...
```
## El mas caotico 

Este metodo para estandarizar tus commits es el culpable de que este escribiendo esto, ya que llama mucho la atención. Comence ha ver algunos repositorios donde se añadian emojis segidos del la descripción, al principio crei que solo era un metodo para hacer mas fashion nuestros commits, pero tirado por la curiosidad fui a ver como añadir emojis y descubri el porque de todo esto. 

Esta convencion me parece tan valida como la otra y igual de adaptable a tus necesidades, aunque en algunos casos creo que el uso de emojis se pueda ver de forma clara el objetivo de cada uno como 🐛, 🚑 o ✨; en otros no esta tan claro, no olvidemos que en en la industria es comun tener equipos muy plurales y en diferentes culturas el uso de algunos emojis es totalmente diferente.




#### References

- <https://www.conventionalcommits.org>
- <https://gitmoji.dev/>
- <https://cbea.ms/git-commit/>
- <https://midu.dev/buenas-practicas-escribir-commits-git>
- <https://dev.to/helderburato/patterns-for-writing-better-git-commit-messages-4ba0>
- <https://dev.to/wordssaysalot/art-of-writing-a-good-commit-message-56o7>
- <https://github.com/RomuloOliveira/commit-messages-guide>
- <https://github.com/helderburato/dotfiles/blob/main/git/.gittemplates/commit>
- <https://hashnode.com/post/which-commit-message-convention-do-you-use-at-work-ck3e4jbdd00zyo4s1h7mc7e0g>

{{< css.inline >}}
<style>
.canon { background: white; width: 100%; height: auto; }
</style>
{{< /css.inline >}}
