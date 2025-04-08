struct Nested1 { x: Int; y: Bool }
struct Nested2 { nested: Nested1; flag: Bool }
struct Nested3 { nested2: Nested2; number: Int }

contract TestContract {
    data: Nested3;

    init() {
        self.data = Nested3{nested2:Nested2{nested:Nested1{x:1,y:true},flag:false},number:99};
    }
}