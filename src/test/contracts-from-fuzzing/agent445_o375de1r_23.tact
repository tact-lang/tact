// Contract with large deeply nested optional struct tree
struct L3 {
    x: Int?;
}
struct L2 {
    child: L3?;
}
struct L1 {
    child: L2?;
}
contract MegaNested {
    root: L1 = L1{ child: L2{ child: L3{ x: null } } };
}
