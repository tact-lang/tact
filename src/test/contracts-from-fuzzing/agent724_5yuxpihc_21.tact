struct Layer3 {
    c: Int;
}

struct Layer2 {
    b: Layer3; 
}

struct Layer1 {
    a: Layer2;
}

contract FlatNested {
    content: Layer1;

    init() {
        self.content = Layer1{a:Layer2{b:Layer3{c:123}}};
    }
}