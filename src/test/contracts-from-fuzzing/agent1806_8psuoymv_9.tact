struct MultiType {
    x: Int;
    y: Bool;
    z: String;
}

struct Wrapper {
    first: MultiType;
    second: MultiType;
    third: MultiType;
}

contract MultipleStructsTest {
    state: Wrapper;
    init() {
        self.state = Wrapper{
            first: MultiType{x:1,y:true,z:"a"},
            second: MultiType{x:2,y:false,z:"b"},
            third: MultiType{x:3,y:true,z:"c"}
        };
    }
}