/**
 * Copyright (c) Whales Corp.
 * All Rights Reserved.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

import type { Maybe } from "../utils/maybe";

export type ABIError = {
    message: string;
};

export type ABITypeRef =
    | {
          kind: "simple";
          type: string;
          optional?: Maybe<boolean>;
          format?: Maybe<string | number | boolean>;
      }
    | {
          kind: "dict";
          format?: Maybe<string | number | boolean>;
          key: string;
          keyFormat?: Maybe<string | number | boolean>;
          value: string;
          valueFormat?: Maybe<string | number | boolean>;
      };

export type ABIField = {
    name: string;
    type: ABITypeRef;
};

export type ABIType = {
    name: string;
    header?: Maybe<number>;
    fields: ABIField[];
};

export type ABIArgument = {
    name: string;
    type: ABITypeRef;
};

export type ABIGetter = {
    name: string;
    methodId?: Maybe<number>;
    arguments?: Maybe<ABIArgument[]>;
    returnType?: Maybe<ABITypeRef>;
};

export type ABIReceiverMessage =
    | {
          kind: "typed";
          type: string;
      }
    | {
          kind: "any";
      }
    | {
          kind: "empty";
      }
    | {
          kind: "text";
          text?: Maybe<string>;
      };

export type ABIReceiver = {
    receiver: "internal" | "external";
    message: ABIReceiverMessage;
};

export type ContractABI = {
    name?: Maybe<string>;
    types?: Maybe<ABIType[]>;
    errors?: Maybe<Record<number, ABIError>>;
    getters?: Maybe<ABIGetter[]>;
    receivers?: Maybe<ABIReceiver[]>;
};
