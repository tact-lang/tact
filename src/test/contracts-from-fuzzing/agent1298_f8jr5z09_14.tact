struct Foo { a: Int } 

contract TestContract {
    s1: Foo = Foo{a:1};
    s2: Foo = Foo{a:2};
    s3: Foo = Foo{a:3};

    init() {
        self.s1 = Foo{a:10};
        self.s2 = Foo{a:20};
        self.s3 = Foo{a:30};
    }
}