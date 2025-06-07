struct Embed {
  s: Int?;
}

contract ManyEmbed {
  e1: Embed;
  e2: Embed;
  e3: Embed;
  e4: Embed;
  e5: Embed;

  init() {
    self.e1 = Embed{ s: null };
    self.e2 = Embed{ s: null };
    self.e3 = Embed{ s: null };
    self.e4 = Embed{ s: null };
    self.e5 = Embed{ s: null };
  }
}