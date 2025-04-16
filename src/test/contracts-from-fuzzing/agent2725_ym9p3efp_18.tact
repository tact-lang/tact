struct NestA { a:Int }
struct NestB { b:Bool }
struct NestC { c:String }
struct Wrap1 { ax: NestA }
struct Wrap2 { bx: NestB }
struct Wrap3 { cx: NestC }

contract ManyWrappers {
    w1:Wrap1; w2:Wrap2; w3:Wrap3;

    init() {
        self.w1=Wrap1{ax:NestA{a:1}};
        self.w2=Wrap2{bx:NestB{b:true}};
        self.w3=Wrap3{cx:NestC{c:"x"}};
    }
}