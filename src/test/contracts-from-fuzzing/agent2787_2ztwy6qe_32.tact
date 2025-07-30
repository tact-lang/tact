struct Sub {
  a: Int;
}

struct Sub2 {
  b: Bool;
}

contract ParamsVsFields(
    c: Int,
    s: Sub,
    s2: Sub2,
    x: Int?,
    y: Bool?
) {
    // forbidden: mixing fields with parameters
}
