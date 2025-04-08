struct DeepNested {
    nestedA: Int;
    nestedB: Bool;
}

struct MiddleNested {
    middleA: DeepNested;
    middleB: Int;
}

struct TopStruct {
    a: Int;
    b: MiddleNested;
    c: Bool;
}

contract MultiLayerStruct {
    complex: TopStruct;

    init() {
      self.complex = TopStruct{
        a: 1, 
        b: MiddleNested{ middleA: DeepNested{ nestedA: 42, nestedB: false }, middleB: 5 },
        c: true
     };
    }
}