// persistent storage of struct with optional Address and null default
struct MaybeOwner {
  owner: Address?;
}

contract TestContract {
  data: MaybeOwner;

  init() {
    self.data = MaybeOwner{
      owner: null
    };
  }
}