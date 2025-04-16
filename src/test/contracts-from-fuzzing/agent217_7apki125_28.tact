struct Rec1 { next: Rec2; } 
struct Rec2 { next: Rec3; }
struct Rec3 { next: Rec4; }
struct Rec4 { next: Rec5; }
struct Rec5 { next: Rec6; }
struct Rec6 { next: Rec7; }
struct Rec7 { next: Rec8; }
struct Rec8 { next: Rec9; } 
struct Rec9 { final: Int; }

contract DeepRec {
  data: Rec1;

  init() {
    self.data = Rec1{
      next: Rec2{
        next: Rec3{
          next: Rec4{
            next: Rec5{
              next: Rec6{
                next: Rec7{
                  next: Rec8{
                    next: Rec9{final:42}
                  }
                }
              }
            }
          }
        }
      }
    };
  }
}