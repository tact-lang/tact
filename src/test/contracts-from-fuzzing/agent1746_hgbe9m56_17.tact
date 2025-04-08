// Deep optional chain
struct Optional1 { x: Int?; }
struct Optional2 { f: Optional1?; }
struct Optional3 { f: Optional2?; }

contract DeepOptional {
    opt: Optional3;

    init() {
        self.opt = Optional3{f: Optional2{f: Optional1{x:null}}};
    }
}
