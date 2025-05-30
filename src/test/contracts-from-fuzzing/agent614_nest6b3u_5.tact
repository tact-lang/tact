struct Rec1 { val: Int; opt: String?; }
struct Rec2 { val: Int; nested: Rec1; opt: String?; }
struct Rec3 { val: Int; nested: Rec2; opt: String?; }
struct Rec4 { val: Int; nested: Rec3; opt: String?; }

contract TestContract {
  deep: Rec4;

  init() {
    self.deep = Rec4{
      val: 4,
      nested: Rec3{
        val: 3,
        nested: Rec2{
          val:2,
          nested: Rec1{
            val:1,
            opt: "innermost"
          },
          opt:null
        },
        opt:null
      },
      opt: null
    };
  }
}