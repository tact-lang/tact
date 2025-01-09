primitive Int;
primitive Bool;

struct S { f : Int }

fun foo(b: bounced<S>): Bool {
  return b == null;
}

