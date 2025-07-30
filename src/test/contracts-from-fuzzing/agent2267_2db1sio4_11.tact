struct L1 { x: Int; y: Int; z: Int; }

struct L2 { a: L1; b: L1; c: L1; }

struct L3 { k: L2; m: L2; n: L2; }

contract NestedLayers {
  structData: L3;

  init() {
    self.structData = L3{
      k: L2{a:L1{x:1,y:2,z:3},b:L1{x:4,y:5,z:6},c:L1{x:7,y:8,z:9}},
      m: L2{a:L1{x:10,y:11,z:12},b:L1{x:13,y:14,z:15},c:L1{x:16,y:17,z:18}},
      n: L2{a:L1{x:19,y:20,z:21},b:L1{x:22,y:23,z:24},c:L1{x:25,y:26,z:27}}
    };
  }
}
