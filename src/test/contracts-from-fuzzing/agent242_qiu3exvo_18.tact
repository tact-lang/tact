struct Leaf { x: Int as int64; y: Int as uint32; }
struct MidOpt { leaf: Leaf?; }
struct TopOpt { mid: MidOpt?; }

contract DeepOpt {
    nested: TopOpt = TopOpt{ mid: null };
}