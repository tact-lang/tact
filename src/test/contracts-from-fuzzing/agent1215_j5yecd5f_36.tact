struct StrStruct {
  text: String;
  tOpt: String?;
}

contract StrHeavyFields(
  s1: StrStruct, 
  s2: StrStruct?,
  s3: StrStruct,
  s4: StrStruct?,
) {}