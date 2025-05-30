struct T1 { a: Int; }
struct T2 { b: Bool; }
struct T3 { c: String; }

struct ManyStructs {
  t1: T1;
  t2: T2;
  t3: T3;
}

contract MultiStructParam(
  m: ManyStructs,
  n: Int,
) {}