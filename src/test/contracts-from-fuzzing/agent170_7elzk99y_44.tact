// optional struct inside optional struct inside contract storage
struct InnerMost {
 a: Int?;
}

struct MiddleOpt {
 i: InnerMost?;
}

contract OptStructInOpt {
 middle: MiddleOpt?;

 init() {
   self.middle = null;
 }
}