struct Texts {
  greeting: String = "Hello, blockchain user!";
  info: String?;
  bye: String = "Goodbye!";
}

contract TestContract {
  texts: Texts;

  init() {
    self.texts = Texts{
      info: "optional info here"
    };
  }
}