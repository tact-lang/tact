struct Foo {
    n: Int; 
}

contract DefaultStruct {
    data: Foo = Foo{ n: 42 };

    init() {
        self.data = Foo{ n: 5 };
    }
}