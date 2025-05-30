// deeply nested contracts sharing a struct definition with optional complexity
struct Nested {
    a: Int?;
    b: String?;
}

contract A { v: Nested; init(){self.v=Nested{a:null,b:"a"};} }
contract B { v: Nested; init(){self.v=Nested{a:5,b:null};} }