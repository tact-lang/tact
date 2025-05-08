struct L3 { x: Int; y: Bool; z: String; }
struct L2 { inner: L3; a: Int; }
struct L1 { inner: L2; }

contract DeepWide {
    data: L1 = L1{ inner: L2{ inner: L3{ x:1, y:true, z:"z" }, a:2 } };
}