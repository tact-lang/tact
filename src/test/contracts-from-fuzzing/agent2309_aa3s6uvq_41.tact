// test deep nesting with trailing optional
struct Leaf { v: Int; }
struct Mid {
    leaf: Leaf?; 
}
struct Top {
    mid: Mid;
}
contract DeepTrail {
    t: Top;
    init() {
        self.t = Top{ mid: Mid{ leaf: null }};
    }
}