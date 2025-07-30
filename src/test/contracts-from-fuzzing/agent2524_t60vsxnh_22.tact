struct S1 {
  maybe: Int?;
}

struct S2 {
  inner: S1?;
}

contract BugEdge {
  data: S2 = S2{ inner: null };
}