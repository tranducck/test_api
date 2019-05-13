import Box from './Box.json'
import Catgut from './Catgut.json'
import ClothDecoration from './Cloth Decoration.json'
import Cowhide from './Cowhide.json'
import FurClothing from './Fur clothing.json'
import Gloves from './Gloves.json'
import Handbag from './Handbag.json'
import Harness from './Harness.json'
import Leather from './Leather.json'
import OtherLeather from './Other leather.json'
import Peltry from './Peltry.json'
import Pigskin from './Pigskin.json'
import Purse from './Purse.json'
import ReclaimedLeather from './Reclaimed leather.json'
import SaltpeterTreatmentCowhide from './Saltpeter-treatment cowhide.json'
import SaltpeterTreatmentPigskin from './Saltpeter-treatment Pigskin.json'
import SaltpeterTreatmentSheepskin from './Saltpeter-treatment Sheepskin.json'
import SheepLeather from './Sheep leather.json'
import Suitcase from './Suitcase.json'
import Waistband from './Waistband.json'
import { concat } from 'lodash'

const arr = concat(
  Box,
  Catgut,
  ClothDecoration,
  Cowhide,
  FurClothing,
  Gloves,
  Handbag,
  Harness,
  Leather,
  OtherLeather,
  Peltry,
  Pigskin,
  Purse,
  ReclaimedLeather,
  SaltpeterTreatmentCowhide,
  SaltpeterTreatmentPigskin,
  SaltpeterTreatmentSheepskin,
  SheepLeather,
  Suitcase,
  Waistband,
)

export default arr
