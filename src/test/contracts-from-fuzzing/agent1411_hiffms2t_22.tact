// contract with contract parameters using optional and nested fields
struct Params {
  title: String;
  comment: String?;
}

contract ParamTest2(
    id: Int,
    flag: Bool?,
    p: Params?
) {
    receive() {
        let _ = self.id;
        let _ = self.flag;
        let _ = self.p;
    }
}