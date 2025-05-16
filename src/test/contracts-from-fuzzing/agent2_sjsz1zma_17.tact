struct SDefOpt {
  id: Int = 5;
  flag: Bool = true;
  note: String? = null;
}

contract DefOptStorage {
  field: SDefOpt = SDefOpt{};
}