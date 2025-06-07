struct SeqA {
  next: SeqB;
}

struct SeqB {
  next: SeqC;
}

struct SeqC {
  flag: Bool;
}

contract TestSeq {
  data: SeqA;

  init() {
    self.data = SeqA {
      next: SeqB {
        next: SeqC {
          flag: true
        }
      }
    };
  }

  receive() {
    let _ = self.data.next.next.flag;
  }
}