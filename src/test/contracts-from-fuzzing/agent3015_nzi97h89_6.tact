struct Wide1 { a: Int; b: Bool; c: String; }
struct Wide2 { d: Int; e: Bool; f: String; }
struct Container {
    one: Wide1;
    two: Wide2;
}

contract WideNested {
    data: Container;

    init() {
        self.data = Container{
            one: Wide1{a:1,b:true,c:"x"},
            two: Wide2{d:2,e:false,f:"y"}
        };
    }
}