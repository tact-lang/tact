struct Nested1 { x: Int }
struct Nested2 { inner1: Nested1 }
struct Nested3 { inner2: Nested2 }
struct Nested4 { inner3: Nested3 }
contract DeepNestOptional {
    deep: Nested4?;
}