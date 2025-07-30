struct Leaf {
  score: Int;
}

struct Branch {
  leaf: Leaf?;
  label: String;
}

struct Root {
  branch: Branch;
  owner: Address;
}

contract TestContract(
  root: Root,
  description: String?,
  verified: Bool
) {}