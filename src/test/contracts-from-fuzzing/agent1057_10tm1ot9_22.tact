struct OptionalInMessage {
  optStr: String?;
  optInt: Int?;
}

message(12345) Holder {
  nested: OptionalInMessage;
  flag: Bool?;
}

contract MessInStore {
  storage: Holder;

  init(){
    self.storage = Holder{
      nested: OptionalInMessage{optStr:null,optInt:null},
      flag:true
    };
  }
}