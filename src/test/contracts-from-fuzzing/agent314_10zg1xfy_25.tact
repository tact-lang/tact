// contract with nested struct containing booleans, ints, strings and nullable fields
struct InnerData {
    a: Int; 
    b: String; 
    c: Bool?; 
}

contract Container {
    data: InnerData;
    init() {
        self.data = InnerData{
            a: 3,
            b: "abc",
            c: null
        };
    }
}