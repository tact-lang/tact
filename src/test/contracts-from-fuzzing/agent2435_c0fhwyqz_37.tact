struct DeepTree1 {
    a: DeepTree2;
    b: DeepTree2;
}

struct DeepTree2 {
    a: DeepTree3;
    b: DeepTree3;
}

struct DeepTree3 {
    x: Int;
    y: Bool;
}

contract TestContract {
    data: DeepTree1;

    init() {
        self.data = DeepTree1{
            a: DeepTree2{
                a: DeepTree3{x:1,y:true},
                b: DeepTree3{x:2,y:false}
            },
            b: DeepTree2{
                a: DeepTree3{x:3,y:true},
                b: DeepTree3{x:4,y:false}
            }
        };
    }
}