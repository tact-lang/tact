// constant with nested struct using serialization attributes
struct Nested {
    id: Int as uint32;
    val: Int? as int64;
}

contract TestContract {
    const X: Nested = Nested{id:7,val:null};
    get fun id(): Int { return self.X.id; }
}
