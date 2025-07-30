struct SimpleNested {
  inner: InnerStruct;
}

struct InnerStruct {
   s: Inner2;
}

struct Inner2 {
   flag: Bool;
   label: String;
}

contract Test13 {
    s: SimpleNested;

    init() {
        self.s = SimpleNested{
            inner: InnerStruct{
                s: Inner2{ flag:true, label:"hi" }
            }
        };
    }
}