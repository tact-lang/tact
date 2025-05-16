// Very deep nested contract parameter structs
struct D5 { z: Int }
struct D4 { d5: D5 }
struct D3 { d4: D4 }
struct D2 { d3: D3 }
struct D1 { d2: D2 }

contract DeepParamNested(
  root: D1
) {
}