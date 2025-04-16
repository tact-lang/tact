struct SOpt {
  i: Int?;
  b: Bool?;
  s: String?;
}

contract NestedOptionals {
    o1: SOpt = SOpt{i:null,b:null,s:null};
    o2: SOpt = SOpt{i:1,b:true,s:"s"};

    init() {
        self.o1 = self.o1;
        self.o2 = self.o2;
    }

    receive() {
        let _ = self.o1;
        let _ = self.o2;
    }
}