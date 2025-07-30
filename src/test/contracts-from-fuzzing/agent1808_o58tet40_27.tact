struct NestedStr {
 a: Int;
 b: Bool;
}

struct ContainerStr {
 s1: NestedStr;
 s2: NestedStr;
}

contract ContainerStorage {
 storage: ContainerStr;

 init() {
   self.storage = ContainerStr{
     s1: NestedStr{ a:1, b:true },
     s2: NestedStr{ a:2, b:false }
   };
 }
}