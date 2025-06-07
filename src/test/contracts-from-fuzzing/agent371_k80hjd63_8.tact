struct LargeNested1 { a:Int; b:Int; c:Int; d:Int; e:Int; }
struct LargeNested2 { f:Int; g:Int; h:Int; i:Int; j:Int; }
struct Container {
    first: LargeNested1;
    second: LargeNested2;
}

contract TestContract {
    storage: Container;
    init() {
        self.storage = Container{
            first: LargeNested1{ a:1,b:2,c:3,d:4,e:5 },
            second: LargeNested2{ f:6,g:7,h:8,i:9,j:10 }
        };
    }
}
