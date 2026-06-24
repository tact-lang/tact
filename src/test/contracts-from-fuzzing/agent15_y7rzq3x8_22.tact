struct DeepInner { a: Int; b: Bool; }
struct Inner { di: DeepInner; s: String; }
struct Container { x: Int; y: Inner; z: Bool; }

contract TestContract {
    s1: Container;
    s2: Container;
    s3: Container;

    init() {
        self.s1 = Container{
            x:1,
            y:Inner{di:DeepInner{a:10,b:true}, s:"s1"},
            z:true
        };
        self.s2 = Container{
            x:2,
            y:Inner{di:DeepInner{a:20,b:false}, s:"s2"},
            z:false
        };
        self.s3 = Container{
            x:3,
            y:Inner{di:DeepInner{a:30,b:true}, s:"s3"},
            z:true
        };
    }
}