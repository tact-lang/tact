struct WithString {
  s: String;
  o: String?;
}

struct Holder {
  h1: WithString;
  h2: WithString;
}

contract StringCompose {
  comp: Holder;

  init() {
    self.comp = Holder{
      h1: WithString{ s:"a", o:null },
      h2: WithString{ s:"b", o:null }
    };
  }
}