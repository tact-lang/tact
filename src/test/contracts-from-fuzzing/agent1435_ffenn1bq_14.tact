struct D { x: Int } 
struct C { d: D?; s: String; } 
struct B { c: C?; flag: Bool } 
struct A { b: B?; num: Int? }

contract Complex {
    state: A;
    init() {
        self.state = A{
            b: null,
            num: null
        };
    }
}