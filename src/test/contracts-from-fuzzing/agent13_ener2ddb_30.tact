struct AB {
 a: Int;
 b: Int;
}

struct Holder {
 item1: AB;
 item2: AB?;
}

contract OptSer {
 val: Holder;

 init() {
  self.val = Holder{
    item1: AB{ a:1, b:2 },
    item2: null
  };
 }
}