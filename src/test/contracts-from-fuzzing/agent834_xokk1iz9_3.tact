struct Deep3 {
    val: Int;
}

struct Deep2 {
    nest: Deep3;
}

struct Deep1 {
    nest: Deep2;
}

contract NestedStore {
    data: Deep1 = Deep1{nest: Deep2{nest: Deep3{val: 123}}};
}
