struct Leaf {
  score: Int?;
}

struct Branch {
  leaf: Leaf?;
  label: String;
}

contract TestContract(
  mainBranch: Branch?,
  backupBranch: Branch?,
  description: String?,
  active: Bool?,
) {}