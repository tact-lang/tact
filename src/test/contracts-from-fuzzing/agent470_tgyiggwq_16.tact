struct SP {
  a: Int;
  b: Int?;
}

struct MP {
  c: SP;
  d: SP;
}

struct LP {
  e: MP;
  f: MP;
}

contract NestedDup {
    val: LP;
    init() {
        self.val = LP{
            e: MP{
                c: SP{a:1,b:null},
                d: SP{a:2,b:null}
            },
            f: MP{
                c: SP{a:3,b:null},
                d: SP{a:4,b:null}
            }
        };
    }
}