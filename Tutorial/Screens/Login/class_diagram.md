<|--	Inheritance
*--	Composition
o--	Aggregation
-->	Association
--	Link (Solid)
..>	Dependency
..|>	Realization
..	Link (Dashed)

```mermaid
classDiagram
  class LoginDisplay {
    <<interface>>
    +loginSuccess
    +loginValidateFailure
    +loginFailure
    +showLoading
  }
  class LoginViewController {
    -login()
  }

  class LoginPresenter {
    <<interface>>
    +login()
  }
  class LoginPresenterImpl {
    LoginDisplay loginVC
    AuthRepository authRepository

    -validate()
    +login()
  }

  class AuthRepository {
    <<interface>>
    +login()
  }

  class AuthRepositoryImpl {
    AuthAPIService authService
    +login()
  }

  class AuthAPIService {
    <<interface>>
    +login()
  }

  class AuthAPIServiceImpl {
    AuthAPIService authService
    +login()
  }

  LoginViewController --> LoginPresenter
  LoginViewController ..> LoginDisplay

  LoginPresenterImpl ..> LoginPresenter
  LoginPresenterImpl --> LoginDisplay
  LoginPresenterImpl --> AuthRepository

  AuthRepositoryImpl ..> AuthRepository
  AuthRepositoryImpl --> AuthAPIService

  AuthAPIServiceImpl ..> AuthAPIService
```