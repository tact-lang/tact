struct One {
 a: Int?;
}

struct Two {
 a: One?;
}

struct Three {
 a: Two?;
}

struct Four {
 a: Three?;
}

contract DeepOptionChain {
 val: Four;

 init() {
 self.val = Four{ a: Three{ a: Two{ a: One{ a: null } } } };
 }
}