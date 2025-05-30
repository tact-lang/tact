struct Foo {
    a: Int = 7; 
    b: Bool?;   
    c: String = "hi";
}

contract TestContract {
    foo: Foo = Foo{};  

    init() {}
}