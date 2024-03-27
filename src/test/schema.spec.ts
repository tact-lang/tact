import fs from 'fs';
import path from 'path';
import Ajv from 'ajv';
import { __DANGER_resetNodeId } from '../grammar/ast';

describe('configuration schema', () => {
  const ajv = new Ajv();
  const schema = JSON.parse(fs.readFileSync(path.join(__dirname, '..', '..', 'grammar', 'configSchema.json'), 'utf8'));

  beforeEach(() => {
    __DANGER_resetNodeId();
  });

  it('should validate Tact config', () => {
    const tactConfig = JSON.parse(fs.readFileSync(path.join(__dirname, '..', '..', 'tact.config.json'), 'utf8'));

    const validate = ajv.compile(schema);
    validate(tactConfig);

    expect(validate.errors).toBeNull();
  });

  it('should validate test config', () => {
    const testConfig = JSON.parse(fs.readFileSync(path.join(__dirname, 'test-tact.config.json'), 'utf8'));

    const validate = ajv.compile(schema);
    validate(testConfig);

    expect(validate.errors).toBeNull();
  });
});
