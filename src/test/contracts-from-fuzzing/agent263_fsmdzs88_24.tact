struct Tiny { x: Int }

struct Mid { child: Tiny }

struct Big {
  left: Mid;
  right: Mid;
}

contract NestedSymmetry {
    val: Big;

    init() {
        self.val = Big{left: Mid{child:Tiny{x:7}}, right: Mid{child:Tiny{x:8}}};
    }
}