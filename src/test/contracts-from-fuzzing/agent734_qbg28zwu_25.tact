struct A { one: Int; two: Int?; three: Bool; four: String?; }

contract TestContract {
  s: A = A { one: 1, two: null, three: true, four: null };
}