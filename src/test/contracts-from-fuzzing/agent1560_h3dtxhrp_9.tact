struct DeepNest4 {
  w: Int;
}

struct DeepNest3 {
  d4: DeepNest4;
}

struct DeepNest2 {
  d3: DeepNest3;
}

struct DeepNest1 {
  d2: DeepNest2;
}

contract TestContract {
    deep: DeepNest1 = DeepNest1{d2: DeepNest2{d3: DeepNest3{d4: DeepNest4{w: 77}}}};
}