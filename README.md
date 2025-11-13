# Scala-like-Haskell

**Scala의 함수 문법 + Haskell의 순수 평가 모델**  
두 언어의 장점을 결합한 실험적 하이브리드 함수형 언어입니다.

본 프로젝트는 *Freeing-the-Lang* 언어 연구 생태계의 일부로,  
"기존 언어를 의미 기반으로 재해석한다"는 목표로 만들어졌습니다.

---

## ✨ 특징

- ✔ **Scala 스타일 람다 문법**
  ```scala
  x => x + 1







✔ Haskell 스타일 순수 평가 모델
substitution 기반 evaluator

side-effect-free expression model






✔ Mini-Lang 구조
Lexer → Parser → AST → Evaluator

간단하지만 언어의 기본 개념을 모두 포함






✔ 예제 실행 가능
examples/hello.slh 제공






✔ 최소 코드로 구성된 실험용 언어 엔진







📦 디렉토리 구조


src/
 ├── Lexer.hs       # 토큰 변환기
 ├── Parser.hs      # AST 파서 (Scala 스타일)
 ├── Evaluator.hs   # 의미 평가기 (Haskell 스타일)
 └── Main.hs        # 실행기(Interpreter)

examples/
 └── hello.slh      # 예제 코드

dist/               # 빌드 아웃풋
proof/              # ProofLedger 자동 생성




🚀 실행 방법


1. Haskell 설치 (GHC)


sudo apt install ghc



2. 실행


runhaskell src/Main.hs




🧪 예제 코드


examples/hello.slh:


x => x



실행 시:


[Tokens]
[TokIdent "x", TokArrow, TokIdent "x", TokEOF]

[AST]
Func "x" (Var "x")

[Result]
Func "x" (Var "x")




🧠 언어 철학


이 프로젝트는 다음 두 가지 컨셉을 실험합니다:


1) Scala의 표현식 중심 함수 구조




깔끔한 람다 문법


단순한 구조적 AST




2) Haskell의 의미 기반 평가 모델




substitution


순수 함수


side-effect-free




두 세계관을 결합한 "작고 단순하지만 개념적으로 강력한" 실험 언어입니다.



🔧 향후 계획 (로드맵)




[ ] 패턴 매칭 도입


[ ] 타입 시스템 프로토타입


[ ] ADT(Algebraic Data Type) 추가


[ ] 커링 및 부분 적용 지원


[ ] Scala-style match-case 문


[ ] Haskell-style type inference


[ ] C++ / Rust / Go transpiler 실험





🧾 자동화


이 리포는 GitHub Actions 를 사용해:




✔ 3OS 빌드 (Ubuntu/macOS/Windows)


✔ ProofLedger 생성


✔ Unified Release ZIP 자동 업로드




를 수행합니다.



📄 라이선스


MIT License



---

